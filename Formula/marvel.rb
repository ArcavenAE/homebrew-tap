class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260808.212358.740f3a3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-212358-740f3a3/marvel-darwin-arm64"
    sha256 "6024e11a69d1285ae790deac40847283059f155211cfd218352939f3087ae3a4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-212358-740f3a3/marvel-darwin-amd64"
    sha256 "3facaa7a04abc4cefce2e9d4b2c636938be6a53ac641a664c53ff2b04b91a19a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-212358-740f3a3/marvel-linux-arm64"
    sha256 "b87b8eacc1ffd15ba1d05a19c6211d388cf81c0a7477ca1e5234f922592dd980"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-212358-740f3a3/marvel-linux-amd64"
    sha256 "e6ee708681a9f1b4e0c5f87406e05668ab6d2ef27f058d9ca11f00ef30b3b125"
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
