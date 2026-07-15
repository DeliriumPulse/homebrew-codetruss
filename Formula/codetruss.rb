class Codetruss < Formula
  desc "Local-first acceptance gate and receipts for AI-generated code"
  homepage "https://codetruss.com/cli"
  url "https://github.com/DeliriumPulse/codetruss-cli/releases/download/v0.2.24/codetruss-cli-0.2.24.tgz"
  sha256 "793895784552e5d59540ffcc9dc2acf6bff6f778b59f9010bd901e4d4c3fa712"
  license :cannot_represent

  depends_on "node"

  def install
    libexec.install "CHANGELOG.md", "LICENSE", "README.md", "SBOM.cdx.json",
                    "SECURITY.md", "THIRD_PARTY_NOTICES.md", "dist", "package.json"
    bin.install_symlink libexec/"dist/cli.cjs" => "codetruss"
  end

  test do
    assert_match "codetruss #{version}", shell_output("#{bin}/codetruss --version")

    system "git", "init", "--quiet"
    system bin/"codetruss", "init", "--allow", "src/**"
    assert_path_exists testpath/".codetruss.yml"
    assert_match "- src/**", (testpath/".codetruss.yml").read
  end
end
