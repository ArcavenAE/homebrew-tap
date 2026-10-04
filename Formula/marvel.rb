class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.180425.fd80497"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-180425-fd80497/marvel-darwin-arm64"
    sha256 "140ef4a5008400e3fcb355b7eba922b68c86d5a68cfa17efdbf0ddf46cb17008"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-180425-fd80497/marvel-darwin-amd64"
    sha256 "5f491d7fde880f107ef4dd10ef9eae418fe97b839e8ef13d65dea03d6cab0170"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-180425-fd80497/marvel-linux-arm64"
    sha256 "d78f386e00ea0298eafad52848a252ad13bf3b1d1f0d6f2b3552b4ecc3a026ad"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-180425-fd80497/marvel-linux-amd64"
    sha256 "f370deddc3f5285d9441d372a898e8e3e7d20ff0a775ea694736c27d96a3a5f2"
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
