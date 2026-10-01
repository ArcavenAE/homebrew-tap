class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261001.204106.ee7666d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261001-204106-ee7666d/marvel-darwin-arm64"
    sha256 "597dc8cc1fc75ff1c141d14b08acdda00469916326d0604040e504d8bac7ac97"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261001-204106-ee7666d/marvel-darwin-amd64"
    sha256 "e3e139fd1faffa1eee43638714296769a405ece9910f71a28f99a403913cf486"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261001-204106-ee7666d/marvel-linux-arm64"
    sha256 "8b614bc4979557c061291b999e769c6e62d48758e0090ae39e7a704a2f706a6d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261001-204106-ee7666d/marvel-linux-amd64"
    sha256 "0561e28c6c0dd3ac3f83add866ae3b5d2f2529144713a20c09f1bd7f79c513bc"
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
