class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.033417.e1d6750"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-033417-e1d6750/marvel-darwin-arm64"
    sha256 "3c9e9b96eaea262e7be4b2f56b71299d254aa5bed5ea03679d5281308ce7a679"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-033417-e1d6750/marvel-darwin-amd64"
    sha256 "3e33b227a8b833b0df3b4c61f80a0b7014fcc3d5748b1817f561ca510fa8a20d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-033417-e1d6750/marvel-linux-arm64"
    sha256 "359ddffb09df118a175a5cd0e1665993162506c8113c4dae0563a5e960883d0c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-033417-e1d6750/marvel-linux-amd64"
    sha256 "b71ce673ba7e522468d9f94bf9a2ca0fb7629865064033827c4ad30a956369ab"
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
