class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260912.232434.7dfc5bc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-232434-7dfc5bc/marvel-darwin-arm64"
    sha256 "85617a17087847865f61dfb6016d33755799b1f2c1692e1ff4158d5823d6bfc8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-232434-7dfc5bc/marvel-darwin-amd64"
    sha256 "d59b964a98e33d3e93c97644d2d12fd58347557d83645333e98c9332309bb1ae"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-232434-7dfc5bc/marvel-linux-arm64"
    sha256 "263f5a8909c34e06726fd25db4ad79f031d4946a2f7221a7b1f3592b13bb6c95"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-232434-7dfc5bc/marvel-linux-amd64"
    sha256 "9cdea0fbbcde783a75b456a9cfd66f2b9f663c768181b5b890baa8382f6ffd0c"
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
