class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260930.122231.591a547"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-122231-591a547/marvel-darwin-arm64"
    sha256 "11bbf0549d85044608c361bfc6b964c5765794f5de2c39b835270a4a40e2f47f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-122231-591a547/marvel-darwin-amd64"
    sha256 "9877b9b34a223dc102e008a577e7c3a6ac76765004230c353749f86967fbf797"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-122231-591a547/marvel-linux-arm64"
    sha256 "e674c3670b92d2f3c1194831bfdeeb265e5bcb0858deb2a1b37eec016b10901a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-122231-591a547/marvel-linux-amd64"
    sha256 "140119f0997d8e083275cf19cac492533b662005638f61c534a791e4f2b7ad9d"
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
