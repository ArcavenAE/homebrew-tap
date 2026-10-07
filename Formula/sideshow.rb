class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261007.011850.df84186"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-011850-df84186/sideshow-darwin-arm64"
    sha256 "297b0e8988e51179b47522c48368e399afa83c77ce000967a0ca6179dcfb49b9"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-011850-df84186/sideshow-darwin-amd64"
    sha256 "781fad949e0ac0c10ee411cb733929205f912efdb687d72c678879283e45cce7"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-011850-df84186/sideshow-linux-amd64"
    sha256 "06d5c003783aa533443bd586c63d13ad718b5cf27821f7a4e4ba108662928703"
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
