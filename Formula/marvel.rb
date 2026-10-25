class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261025.025857.db77731"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-025857-db77731/marvel-darwin-arm64"
    sha256 "1101af6064a2782c52fe45917594370469d8057a3e16e185ecba60f4f6860735"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-025857-db77731/marvel-darwin-amd64"
    sha256 "5b3e01ec2b634f4305d662d1ef537654e69ee15c7542373a60975f543f50bd08"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-025857-db77731/marvel-linux-arm64"
    sha256 "dbffaddb8e9effda3c3c9fc7f5ef6908b5c925e05afc01fc17f3d4944056481d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-025857-db77731/marvel-linux-amd64"
    sha256 "a42deca4cdaf36a503458fff0a27544ac0e315d5734f47f4115a9525e13038a7"
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
