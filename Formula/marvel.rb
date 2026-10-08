class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.225018.086fe59"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-225018-086fe59/marvel-darwin-arm64"
    sha256 "57d5ecd6559c0a9a3587635427a0f22051014ee7ad0a1ab13c16525a1b210e8f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-225018-086fe59/marvel-darwin-amd64"
    sha256 "5a46584d654038da5d15ea2c57e14f64d5e3fd3724d8a8d7be9d3369999c333e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-225018-086fe59/marvel-linux-arm64"
    sha256 "92171b766ce2b088039caaa00e8d89b9b9f27a3e5cd20fcb544725176bba3fe5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-225018-086fe59/marvel-linux-amd64"
    sha256 "edd48b0a7ea10fda488f59880c1a7544e4225cbdced97ce616b50fefb13900eb"
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
