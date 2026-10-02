class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.230409.de9e409"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-230409-de9e409/marvel-darwin-arm64"
    sha256 "611275696ebf6da30da93d3408b96ddcf900c998c54dc42c6f267abe8bf98529"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-230409-de9e409/marvel-darwin-amd64"
    sha256 "88b76039593df9a42eee7bb4d4a4bb6096eea244086b7d289f839e0decba069f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-230409-de9e409/marvel-linux-arm64"
    sha256 "ff5aab4965a8cf8ec3de970cebaf0764778a1aa584691148bc90df01b56be838"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-230409-de9e409/marvel-linux-amd64"
    sha256 "e8f83941b298e8e19bb51f9500c2685e91f8150611be02f89e652997654db7d6"
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
