class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261116.204212.120a9cb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-204212-120a9cb/marvel-darwin-arm64"
    sha256 "83ade0d2f986c870ff5b0523c818890cff19c3f56da14a0e7be1a5c92eddb494"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-204212-120a9cb/marvel-darwin-amd64"
    sha256 "e5bdb3254683e1e27e08afa5b4cbac3583ae84b30ba75af5553f29d08bde796c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-204212-120a9cb/marvel-linux-arm64"
    sha256 "1d9929c7ba9949cf302795b70ef6a5ea96c9e36f64e5195da7dc9b78032201b4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-204212-120a9cb/marvel-linux-amd64"
    sha256 "e6c3c2cab9d327066e53d51e5677fbd0a21fb23ade847e4c6e867766b4351c64"
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
