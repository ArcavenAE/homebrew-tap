class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261117.173354.9b26d50"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-173354-9b26d50/marvel-darwin-arm64"
    sha256 "46ca38a7f40c51acf047e3ca76bb9d298b88a8534d0c91f11965ca18c2900590"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-173354-9b26d50/marvel-darwin-amd64"
    sha256 "076ccc78ba24018b21958b4ada0f7d43b38c95adb8ce340e9d1dfe21d706d979"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-173354-9b26d50/marvel-linux-arm64"
    sha256 "241214c5f6140ff72519c19b367ad385aa4e02a2618ca60fa1a5ed15c63271a2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-173354-9b26d50/marvel-linux-amd64"
    sha256 "156d632f90ee3c7c47f686e5ed852daa1280f460bdda8ba01c7c85b323064227"
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
