class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261009.093517.ff9d210"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-093517-ff9d210/marvel-darwin-arm64"
    sha256 "2d22e4f8b651a045f2d8d64c54b31347e43b8218d353dbfb19b086365f5a06fb"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-093517-ff9d210/marvel-darwin-amd64"
    sha256 "cf920043e2380bc1e2083726264d1284e033318cbea91483258e793f17060aff"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-093517-ff9d210/marvel-linux-arm64"
    sha256 "65f595fd0cef7239ccf0d36f5baf66a3caf7f025a575607121cbea078de36edb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-093517-ff9d210/marvel-linux-amd64"
    sha256 "5d4c5d68c1396464f771bdd7afd866c4f1afa2dcfbb57d0777ae12f4e9baae1e"
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
