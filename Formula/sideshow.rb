class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260914.134314.e32032f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260914-134314-e32032f/sideshow-darwin-arm64"
    sha256 "8a963c6afee5774ebd8cbf4ba1fba3d8107855156412e05677f50e78c5950fdc"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260914-134314-e32032f/sideshow-darwin-amd64"
    sha256 "e7c2ac2ede428185da07b9f3434e2c24b7ec0f88dbd48fcdfce376ff6c5060c3"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260914-134314-e32032f/sideshow-linux-amd64"
    sha256 "afe1503a6b738ed2a9a93149486daccf3bedb4b6021dd9d04adcd9e504c248ab"
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
