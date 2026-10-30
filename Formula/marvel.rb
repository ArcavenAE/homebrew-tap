class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261030.181227.aeaff57"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-181227-aeaff57/marvel-darwin-arm64"
    sha256 "69fe19461d8ba1258143d88fc5505a352d2c1e1f604d0b338a6f94baa0a8a4a7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-181227-aeaff57/marvel-darwin-amd64"
    sha256 "499d560a8a6f8250b0cb9830651c7d38dc70c4a56bdb0ce2d04772389fec2b8d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-181227-aeaff57/marvel-linux-arm64"
    sha256 "08ff24638123150b6b4a236758212b5ddd0aab0cf0a2a18df115ddb2e93c11c6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-181227-aeaff57/marvel-linux-amd64"
    sha256 "a6b926f4537aa1c1f6af071c1885e31afd2e1c3839cbb301e1c9f76b7cdea5fb"
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
