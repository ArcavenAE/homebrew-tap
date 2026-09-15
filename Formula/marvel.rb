class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260915.162139.0575203"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-162139-0575203/marvel-darwin-arm64"
    sha256 "97ac39cd2ba96f2bef82baec53f0b79673ebb7ac0c4cf6271ebc84b76f056738"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-162139-0575203/marvel-darwin-amd64"
    sha256 "c3e43c76d0d429c0c11ac4e1f95459af2edcf006f1ee4e6fd88d44aadaaf7f54"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-162139-0575203/marvel-linux-arm64"
    sha256 "1c52158f10769ea853896c8d4967e51ab08e0d57845d32027591aa69407fd2b9"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-162139-0575203/marvel-linux-amd64"
    sha256 "e3caf620b8e7e59cf107872536ac94cef4e0bccb094a3e7309892928973e69e9"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
