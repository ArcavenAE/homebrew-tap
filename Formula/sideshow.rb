class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260928.131604.4d30af2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-131604-4d30af2/sideshow-darwin-arm64"
    sha256 "5bd1f59c9c41c09a4a9864e0337581deed985122d35a5942ec17ee41eba0f6a2"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-131604-4d30af2/sideshow-darwin-amd64"
    sha256 "1c5d41ca7217a549ddfa09c367422d31ed4547c81cc349cffd3a30282ca99eac"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-131604-4d30af2/sideshow-linux-amd64"
    sha256 "19fbd9b5414bc01b3650c0fc9d9923b1a422456122276e3664e004215583c113"
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
