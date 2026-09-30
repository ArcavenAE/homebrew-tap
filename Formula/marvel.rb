class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260930.111258.12b08d0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-111258-12b08d0/marvel-darwin-arm64"
    sha256 "97e54f21be4503901ea3b74d669d9e24db41d9a2698098fe09119f067e186bc8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-111258-12b08d0/marvel-darwin-amd64"
    sha256 "e890a6c736a81565196b577c1a91c2f921666d32c3de0f666353d7d0f14335e3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-111258-12b08d0/marvel-linux-arm64"
    sha256 "289c19f28e5e1a77feb9e6a6f2e2ade4e7b6dcce1c0dd865983556d5d81e3b35"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-111258-12b08d0/marvel-linux-amd64"
    sha256 "c51ad7cdf369cb3b49b6796114668f1bb5cc0fbc65417cca88b188a0cc168928"
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
