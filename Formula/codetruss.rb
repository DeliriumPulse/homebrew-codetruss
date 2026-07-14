class Codetruss < Formula
  desc "Local-first acceptance gate and receipts for AI-generated code"
  homepage "https://codetruss.com/cli"
  url "https://github.com/DeliriumPulse/codetruss-cli/releases/download/v0.2.14/codetruss-cli-0.2.14.tgz"
  sha256 "7fd85c939a3224c0678f6541b52ba4dd7e40b68a8dfaffd5bd6c8e0c12425da1"
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
