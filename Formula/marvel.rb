class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.080401.43c4063"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-080401-43c4063/marvel-darwin-arm64"
    sha256 "9540e387240b6b00619c64f171dca8fc33544a44dc38d363e20b5b4e67b5f9da"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-080401-43c4063/marvel-darwin-amd64"
    sha256 "3d3f4ab5b388b7cd7d9564bfa8095bdebe6d000ff49c4ec9028490cb47a82510"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-080401-43c4063/marvel-linux-arm64"
    sha256 "fe16daaa214da8793229e4f08a2ee12fec067b4f4d6402a5ce930a242f41f89f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-080401-43c4063/marvel-linux-amd64"
    sha256 "62a5d9c553148604f5589b067183673c034d7daffc75afbf413acda3ea5f3b96"
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
