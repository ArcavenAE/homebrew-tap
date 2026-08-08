class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260808.020955.c133982"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-020955-c133982/marvel-darwin-arm64"
    sha256 "14f9fb34de1436d82fff863e16e8429e261b71d5ef0c983800f27ce6c7d078f2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-020955-c133982/marvel-darwin-amd64"
    sha256 "c62e0921c175d03fc88e1c6a34c10f10164f57a5818865ea5282c2d0add53232"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-020955-c133982/marvel-linux-arm64"
    sha256 "04aafd10787c225c34dce35ebde71234fc785b6087226ca335d39e40fc1c88aa"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-020955-c133982/marvel-linux-amd64"
    sha256 "5de2c230f573b77bcadce4b43ad616eee49b2f5381ce505e7a417b183b52d3ef"
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
