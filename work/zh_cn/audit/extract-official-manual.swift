import Foundation
import PDFKit

let source = URL(fileURLWithPath: "references/manual/Kingdom of Amulur 공식 한글 설명.pdf")
let destination = URL(fileURLWithPath: "work/zh_cn/audit/official-korean-manual-extracted.md")
let expectedSHA256 = "05204c3a8a489d54a92df321cb33be9d2a33db1787d30bd73477c7bfe5904784"

let sha = Process()
sha.executableURL = URL(fileURLWithPath: "/usr/bin/shasum")
sha.arguments = ["-a", "256", source.path]
let shaOutput = Pipe()
sha.standardOutput = shaOutput
try sha.run()
let actualSHA256 = String(data: shaOutput.fileHandleForReading.readDataToEndOfFile(),
                          encoding: .utf8)?.split(separator: " ").first.map(String.init) ?? ""
sha.waitUntilExit()
guard sha.terminationStatus == 0 && actualSHA256 == expectedSHA256 else {
    fatalError("Official Korean PDF changed; inspect before re-extracting")
}
guard let document = PDFDocument(url: source), document.pageCount == 11 else {
    fatalError("Unexpected manual PDF or page count")
}

var markdown = """
# Official Korean Manual: Searchable Text

Source: `references/manual/Kingdom of Amulur 공식 한글 설명.pdf`
Source SHA-256: `\(expectedSHA256)`
Extracted from the original PDF with PDFKit on 2026-10-12. The PDF
is authoritative; this text is an uncorrected, page-delimited search
aid. PDF text extraction may change visual reading order or spacing.
Use the PDF page number to verify terminology in the original.

"""
for index in 0..<document.pageCount {
    guard let text = document.page(at: index)?.string, !text.isEmpty else {
        fatalError("No extractable text on PDF page \(index + 1)")
    }
    markdown += "\n## PDF page \(index + 1)\n\n"
    markdown += text.replacingOccurrences(of: "\r\n", with: "\n")
        .replacingOccurrences(of: "\r", with: "\n")
    markdown += "\n"
}

try markdown.write(to: destination, atomically: true, encoding: .utf8)
print("pages=\(document.pageCount) characters=\(markdown.count) destination=\(destination.path)")
