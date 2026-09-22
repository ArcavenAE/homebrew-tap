class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every develop push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260922.042436.968d630"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260922-042436-968d630/threedoors-a-darwin-arm64"
    sha256 "515f7ef6ee5b5c2b8c731105f296ff2f5a89d84a56a3727d296f39a93fdefe89"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260922-042436-968d630/threedoors-a-darwin-amd64"
    sha256 "aae968555a67c45e7ba96c14224e5c8ed6a4c798f08102ccbf6613d3aa343240"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260922-042436-968d630/threedoors-a-linux-amd64"
    sha256 "78f1a8686ddb6e096e175147b5fb5c870822f53a390f301dd9c149babec2ea05"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
