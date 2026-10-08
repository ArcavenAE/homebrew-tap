class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.232011.e759b63"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-232011-e759b63/marvel-darwin-arm64"
    sha256 "838e4e6888c5504da9c863ce1a0b91165f6633e88ffc17ee757e565d79828da8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-232011-e759b63/marvel-darwin-amd64"
    sha256 "ed9f901e9073fca2265d6b6fb4f7dab046ae510d86d8ea4c887c2f0f7d781299"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-232011-e759b63/marvel-linux-arm64"
    sha256 "1419e1b98e79964ef95b95685e4d2c4e14f2b7c0cd6669f5211e2c2978b91396"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-232011-e759b63/marvel-linux-amd64"
    sha256 "65720b69d4f5a6ba89ee1a1b992e880788528f79ee4ec5ce8d3e59c264b0ebd8"
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
