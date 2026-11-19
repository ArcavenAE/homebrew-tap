class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261119.042137.eaddd8b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-042137-eaddd8b/marvel-darwin-arm64"
    sha256 "072d9dde19841602aebe8490d9ab165d115cb09ecf8834a6d96af52491349cfc"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-042137-eaddd8b/marvel-darwin-amd64"
    sha256 "b23245c2401e1cc378a35bd0b540f66e5e9425af00b96e68aa272eed98eeb351"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-042137-eaddd8b/marvel-linux-arm64"
    sha256 "63dd6668f859bea453f6c998989896bd4d99c4e9d909512788d209605d58dfe5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-042137-eaddd8b/marvel-linux-amd64"
    sha256 "6f5c755033a1abbae912c258f1de231803dd7f1d5d2bd3d35fce05871d27e57b"
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
