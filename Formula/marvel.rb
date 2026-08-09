class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.065702.4b8d539"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-065702-4b8d539/marvel-darwin-arm64"
    sha256 "8fdf90d277f10f48c6d36740885d79eafc2e09735cf71d25f62ceddbc334164f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-065702-4b8d539/marvel-darwin-amd64"
    sha256 "507cd4f9082028288bcfbd30f9bea1ff7843c5c612c16cb06ade13433b7bd58d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-065702-4b8d539/marvel-linux-arm64"
    sha256 "f7fb366c980e1efcf70acf58813e41197734641fce9f04a0c47730fef6a8df92"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-065702-4b8d539/marvel-linux-amd64"
    sha256 "a1cb28b25ccceef550138d24f07f64a1ead32b9c5793a735f6de38e7496051a3"
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
