class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260807.053514.152bed6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-053514-152bed6/marvel-darwin-arm64"
    sha256 "a71452c36582656522642ad908067bdf0ab34504f34d3e5c0938212ad3cede28"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-053514-152bed6/marvel-darwin-amd64"
    sha256 "de75e7a07aa82a0897a8e8027dd486d8f7e28955efb7cc95c540385fdfed696b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-053514-152bed6/marvel-linux-arm64"
    sha256 "308706562780191f88db97082faf0a216e0302494fd1d9a6c99c4cbdb649cd18"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-053514-152bed6/marvel-linux-amd64"
    sha256 "a392cc5804c31bd5ca4da195291a9b3a837936d45ffd48bc301b5d890db316bd"
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
