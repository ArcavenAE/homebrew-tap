class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261119.211706.eead278"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-211706-eead278/marvel-darwin-arm64"
    sha256 "b64095b701f320e39f264d2830e7cfa0e07dda97f23b5729ee2fe1fe1f6eb53c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-211706-eead278/marvel-darwin-amd64"
    sha256 "ad0beaff64a10c95e5d20c453e8bbb4b16ef512f31dd831895056d74d94b76a3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-211706-eead278/marvel-linux-arm64"
    sha256 "50808a597ee1b9ffa9f34582eddafa75ad02c0ba0912a76794712396ece6a536"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-211706-eead278/marvel-linux-amd64"
    sha256 "e5957a109eb52a59e77351d2834dce9fff6fd938dc63fa789376002085588151"
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
