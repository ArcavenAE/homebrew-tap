class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.040142.8a510b4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-040142-8a510b4/marvel-darwin-arm64"
    sha256 "a0ede38ddf36ad025ee87e4fea45616a2fb9dffe2ccf8d216334af9d6d9610e2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-040142-8a510b4/marvel-darwin-amd64"
    sha256 "478c6c17c675275f6df272af7c780ca0315591d9533d9e37f9895f7afe6db397"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-040142-8a510b4/marvel-linux-arm64"
    sha256 "1783b3d3e5e861a5686391accff8e4adc9f7ef6f263ccc73985c15a1ebaf9ee6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-040142-8a510b4/marvel-linux-amd64"
    sha256 "6684abb95a9658a94e3d234d353102056fadc0af29132ea7e367696c65bc52bc"
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
