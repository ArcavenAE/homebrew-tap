class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260717.233909.05f4f3a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260717-233909-05f4f3a/marvel-darwin-arm64"
    sha256 "ad67b5f85a5ad517c05d820b094df75592fb6c317ddf0ed987d00bff74b08d5d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260717-233909-05f4f3a/marvel-darwin-amd64"
    sha256 "4e16b4de35eb428117d46393e02523ef57c18c72bfc7a6d183a0a1abdcfbd822"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260717-233909-05f4f3a/marvel-linux-arm64"
    sha256 "0c4fe793cf4161f52bd67eb74461abbf1a7023b98567bcc52dc3035dc84724bc"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260717-233909-05f4f3a/marvel-linux-amd64"
    sha256 "785f4b58a599da93179f8faa8505448e8f86fa9e7b6f1435c3af3db94988b471"
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
