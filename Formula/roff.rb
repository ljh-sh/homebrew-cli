# frozen_string_literal: true

# Formula for roff — man page to JSON/Markdown converter.
# Source: https://github.com/ljh-sh/roff
class Roff < Formula
  desc "Skillful man page to JSON/Markdown converter"
  homepage "https://github.com/ljh-sh/roff"
  url "https://github.com/ljh-sh/roff/archive/800885efa00358ecaf070f3cbf35f1065209abac.tar.gz"
  version "0.1.0"
  sha256 "9fc036bf4a5675e9a594ec7d3eb7048855580f108c3f5692aad01f2584a1b900"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Convert man pages to JSON", shell_output("#{bin}/roff tojson --help")
  end
end
