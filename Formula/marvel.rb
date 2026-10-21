class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.204230.04e996c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-204230-04e996c/marvel-darwin-arm64"
    sha256 "0d5013898f1b73b8a8ea6728ba999e96ef1f6d004374d3f3bd7d4a187bb6d929"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-204230-04e996c/marvel-darwin-amd64"
    sha256 "316352446d8404a7447724ac9505172236f1f216f0950fe19eeec2f7bd0dfe51"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-204230-04e996c/marvel-linux-arm64"
    sha256 "0e1f0745e8bed2152854f4b6fb9cbb6e8b402dc8b09ff7097a689bd2e563eb71"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-204230-04e996c/marvel-linux-amd64"
    sha256 "0e0785d59ba1e42f3983bce2d4a979d0021c3d43729476e332b5bb725f019193"
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
