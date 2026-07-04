# Homebrew formula for curtain
# Updated automatically by the release workflow when signing is enabled
# macOS only (arm64).

class Curtain < Formula
  desc "Minimal agent sandbox following the pledge/unveil philosophy"
  homepage "https://github.com/arcavenae/curtain"
  url "https://github.com/arcavenae/curtain/releases/download/alpha-20260704-201729-b841af3/curtain-darwin-arm64"
  version "0.1.0"
  sha256 "c731ce7f5ee1635e6dd60c0d576b2688e77f0f54bb7ed94ca0c721467f175760"
  license "MIT"

  def install
    bin.install "curtain-darwin-arm64" => "curtain"
  end

  test do
    assert_path_exists bin/"curtain"
  end
end
