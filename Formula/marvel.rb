class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260801.023501.8481164"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-023501-8481164/marvel-darwin-arm64"
    sha256 "77876f7a933cd1c64d7b27cbd9d546f0a0041bf58ea441899588da97f0b8666c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-023501-8481164/marvel-darwin-amd64"
    sha256 "c4ae0d05b16b207155829a7ab2daf014c14fb8164ec64474d7706c569ceb16f6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-023501-8481164/marvel-linux-arm64"
    sha256 "f7ab2217451a702198b244bf4b24a26dac5453ed4ee637a427fe593fa98d2a8a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-023501-8481164/marvel-linux-amd64"
    sha256 "5ac9ba78059a13bedd9550b9fb8c4f8774ee194674e269a8d24074d7eb26e720"
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
