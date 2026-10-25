class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261025.035037.25931df"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-035037-25931df/marvel-darwin-arm64"
    sha256 "19793a13cd1ed01bccb43a6cc1b851bacbe414f814ca6f1bbc14f4d0130fdddc"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-035037-25931df/marvel-darwin-amd64"
    sha256 "d8ac45cf3904ccab15f2ba1b4389e4f53f05f01ac9b7bccea6f7e15e6e7c9ff0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-035037-25931df/marvel-linux-arm64"
    sha256 "56d199e16377311433511b72760d35e99dc0f62145a9294a418db6bbbbc995b1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-035037-25931df/marvel-linux-amd64"
    sha256 "3d54ba14134e237426703f5347d61250deac7356d0050ab9be8b19742eac98a0"
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
