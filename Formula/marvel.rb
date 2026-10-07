class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.235049.44419f7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-235049-44419f7/marvel-darwin-arm64"
    sha256 "9a9b9fec804e08a85a733238bb3993f8088dc61c75e19b8c98b95d55db855200"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-235049-44419f7/marvel-darwin-amd64"
    sha256 "ba622ed9c9b49e81cf21de26fef6925b7e33f1375dd1a3c0bbea318e62db2204"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-235049-44419f7/marvel-linux-arm64"
    sha256 "760e63b14960432e168c18703d2b4449bd471e4b458b3da8d698b8a616e17da8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-235049-44419f7/marvel-linux-amd64"
    sha256 "d26911ea1d1f654aa5a75ff05e40e4037c98822fb70607c5a85b8cd2432aa7d5"
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
