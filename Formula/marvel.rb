class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260513.224550.85360e9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-224550-85360e9/marvel-darwin-arm64"
    sha256 "7c401d6b0b2913af251ec4aec3abe897d4c87b609e8202d709863b72861efb48"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-224550-85360e9/marvel-darwin-amd64"
    sha256 "9431578defc0aa76a7708caa08e386cd006de94c5ffa96dd809b71358b6036f7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-224550-85360e9/marvel-linux-arm64"
    sha256 "774fbbc28eec7c2b001cbaa5cf07808fc09b526cc2ea436ef1560bb6cfc2e382"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-224550-85360e9/marvel-linux-amd64"
    sha256 "49088920ea36626420f0cdc23369feeb2be47dabf5d49cc5786713f29dd4ae80"
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
