class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261123.014813.42f1687"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-014813-42f1687/marvel-darwin-arm64"
    sha256 "87dd9d3962f2bc69324304311a5df8e89106dcbfaf8833e1eb07bf8262a08c9c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-014813-42f1687/marvel-darwin-amd64"
    sha256 "97c1cc2efc77101dd5b7ee1594508665d671252468ea729ff876faf679813f6a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-014813-42f1687/marvel-linux-arm64"
    sha256 "39c4ed300a5dba0242fbd5074a700968af7f38bae7d58190473a301d94110096"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-014813-42f1687/marvel-linux-amd64"
    sha256 "1523af8b557d542cc04a9a340c6cf7c5cefbfb5ff9d65d65576e348f7220dcb7"
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
