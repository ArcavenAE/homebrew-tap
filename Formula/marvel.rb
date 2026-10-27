class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.153403.ad7d085"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-153403-ad7d085/marvel-darwin-arm64"
    sha256 "e013343e477dd8cf1dffccb8ab37950282d9e2fbf7faa970bde4ad19b5721dbd"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-153403-ad7d085/marvel-darwin-amd64"
    sha256 "733e5ff6d4c2263d4209b00d20b92debde8c4a1ffa5e3654d34958805f4d87b3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-153403-ad7d085/marvel-linux-arm64"
    sha256 "5c17d3cc1197ce28de999a100cb076c2fde3bbb292eb015831a30a2f913bf2e8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-153403-ad7d085/marvel-linux-amd64"
    sha256 "25efe65d09f8075b040f32a3bae7821b5b622f3efd9848f149bf2261bda8bd29"
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
