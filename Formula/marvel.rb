class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.234937.4e6aacd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-234937-4e6aacd/marvel-darwin-arm64"
    sha256 "2346b5032ae85e4e049bc7f8af4fed3162d60d09983590896c695d823376b98b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-234937-4e6aacd/marvel-darwin-amd64"
    sha256 "fd17b857ce4347d8126a36400cb08fe720ce6faefeffb3cea854a9a358682084"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-234937-4e6aacd/marvel-linux-arm64"
    sha256 "9e6f046d5b946487526d6deb70d4735a9f2d96907288bad572855ab0c50fa652"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-234937-4e6aacd/marvel-linux-amd64"
    sha256 "4ba90a4631b2e2d35d62883401776123f8b70411bf57675f9e20832ef5bd241f"
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
