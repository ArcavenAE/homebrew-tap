class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.033706.703b16a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-033706-703b16a/marvel-darwin-arm64"
    sha256 "56e82d40da931dea08639378bf2b78cc092e8a80bcb8e36c242e2f84a329b3fc"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-033706-703b16a/marvel-darwin-amd64"
    sha256 "97b83c9c15c7e66fd90835cf0bd87b3e53e5519eec1a40721c991c3487ddc938"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-033706-703b16a/marvel-linux-arm64"
    sha256 "b5485a08920adb456403c0cbfceeb4d3bc13796a844c447c733a95dd8ee7051b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-033706-703b16a/marvel-linux-amd64"
    sha256 "4fbffb54179bb5afdec9d8cc854545e4db80b2a87d42d59fccab7cba196c74e3"
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
