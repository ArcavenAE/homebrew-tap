class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261019.084818.610d1a8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-084818-610d1a8/marvel-darwin-arm64"
    sha256 "05e24d50ce57d713b64220c707111c6889d81b695ecc1946fa763a88a0e20cb0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-084818-610d1a8/marvel-darwin-amd64"
    sha256 "1d9f98952db7636c54296f405e25b01b3f755743b6c22fd5e697691e44d0f4d2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-084818-610d1a8/marvel-linux-arm64"
    sha256 "61b3505ba468b7ffc96a61f6b8ebb2fa2e88be6b743a60beab365993b6b17b61"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-084818-610d1a8/marvel-linux-amd64"
    sha256 "d434cfd384477a97ac72f24c5d7e8700e625dddcd12459e30c4eda8c29e8556f"
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
