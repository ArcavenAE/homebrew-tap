class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261014.213116.06155bf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-213116-06155bf/marvel-darwin-arm64"
    sha256 "9fd76ba946b3ea0313f7f32a734e9f959fa077de20c39f3fd1f999b74cfbd702"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-213116-06155bf/marvel-darwin-amd64"
    sha256 "f5f59a801632a1f55cdbef66a78a59c7e065018aea638072a2f94c07cf8d293f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-213116-06155bf/marvel-linux-arm64"
    sha256 "51301a0d3d87049c16c7a3464189aaf3aedcb0a20e44f785f1cebcbd737578cd"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-213116-06155bf/marvel-linux-amd64"
    sha256 "49c24c856f26ad78e5b2e6aa3d7d00123a49533cd7e77424aada3f6fcc98def7"
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
