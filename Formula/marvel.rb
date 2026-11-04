class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261104.184322.1dfff67"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-184322-1dfff67/marvel-darwin-arm64"
    sha256 "f59d5d1625a3240a5614ed20f832b51826ad32b89ce87775f98f3619e35d0740"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-184322-1dfff67/marvel-darwin-amd64"
    sha256 "c1c208afef58c1564c72050fd8472152ade75bbed66d46025951e61e8e49fda0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-184322-1dfff67/marvel-linux-arm64"
    sha256 "2fff4b4552c2d341af7cc2353f01c5ea80e25f06914580ba8853d115a24c5417"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-184322-1dfff67/marvel-linux-amd64"
    sha256 "f7c8ed978fdb3103e84d7b5356229dd4a9673572641bcdbf0505ebd8aeb49798"
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
