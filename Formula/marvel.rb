class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261026.233738.c55e162"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261026-233738-c55e162/marvel-darwin-arm64"
    sha256 "dd1fe4b27733e3e33f9b0ec464e6f477bf914bf1e555a6c0c2804c06c77139e7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261026-233738-c55e162/marvel-darwin-amd64"
    sha256 "c3f3f589b3a48e886cd584e1a724731fe95d256f2d66ec3d8ce6ad661694a801"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261026-233738-c55e162/marvel-linux-arm64"
    sha256 "6bb84c3f94d225c0312ba0904c5c0f1774af16310b44616ba94d637dc850d007"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261026-233738-c55e162/marvel-linux-amd64"
    sha256 "ba169321fc62de2304a711b5350242d63a1c24eed15c563ce4a61a374298b79e"
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
