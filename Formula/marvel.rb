class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260816.213808.6f33008"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260816-213808-6f33008/marvel-darwin-arm64"
    sha256 "ee394e40667402545420232bdb6aee244dc851d2e07a10e27b2d77d2369d5b5e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260816-213808-6f33008/marvel-darwin-amd64"
    sha256 "d573293e2f8c3de5a194c44d9db58fe7b42a6c7fa951b6599830c46d49fafc90"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260816-213808-6f33008/marvel-linux-arm64"
    sha256 "1dbe90f65111eb84cfc580fa2f2c27fab19af4d8c25c07955f0e079f671657fd"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260816-213808-6f33008/marvel-linux-amd64"
    sha256 "9ff7a255f85e44760e992ae1eae3a21e11e10eb4a9c2ae0ced41d7232cc29296"
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
