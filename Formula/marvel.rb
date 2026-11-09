class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.161916.2e36132"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-161916-2e36132/marvel-darwin-arm64"
    sha256 "7f21d912b38549761bbf3f854bcc8f0c206c212d9fbc9ce96e9b807197b99cbd"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-161916-2e36132/marvel-darwin-amd64"
    sha256 "945062258f59cd21dc4791864f84fd29902444f89995abef47f162332448fc16"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-161916-2e36132/marvel-linux-arm64"
    sha256 "1ebfbcdd8a603e2c0bb46d7b0eed5a7671d9ce3cc948a35d1da8ddbca5b281f0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-161916-2e36132/marvel-linux-amd64"
    sha256 "31a097e9cf80695af11054022f4fdc0835070f335a1a34b8731284024a256f13"
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
