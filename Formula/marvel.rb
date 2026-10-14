class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261014.202612.4c3bb72"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-202612-4c3bb72/marvel-darwin-arm64"
    sha256 "f915a7436ea36dbc0c4fdc0cd570f7bfb8167cd7364392540438e7f673fee46d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-202612-4c3bb72/marvel-darwin-amd64"
    sha256 "362994930187d3e9c8f9afe63d584a391d785107b6f798b920716b7758884488"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-202612-4c3bb72/marvel-linux-arm64"
    sha256 "c2eb85eb13d6611256a72f887fcf951bcb49eae022153e210ab56446f25a8e11"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-202612-4c3bb72/marvel-linux-amd64"
    sha256 "56b541ae2d8f7c202a363e02a517e08e56ae50d381d2c10cf5056a3293773836"
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
