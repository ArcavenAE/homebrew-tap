class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260731.235959.cbdd450"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-235959-cbdd450/sideshow-darwin-arm64"
    sha256 "f93270217d60852b3b7ebe46842f3cf3039b2bb4cc5c0252cfad11e22278efa4"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-235959-cbdd450/sideshow-darwin-amd64"
    sha256 "91999d31b83711dd6420e19286d4eb7e128632b9ffcb27acebba8861579f3fee"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-235959-cbdd450/sideshow-linux-amd64"
    sha256 "560d9a0372bf5bd668e22be6e7c379bce633e32e5a3d33bde03ecd55c9b6fa46"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
