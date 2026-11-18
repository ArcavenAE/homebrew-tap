class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261118.021659.df7c79c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-021659-df7c79c/marvel-darwin-arm64"
    sha256 "7d0e4236a29f8f9210cc8410696519bd22ff7bceeffc208f24f1b38380e3dfba"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-021659-df7c79c/marvel-darwin-amd64"
    sha256 "eef4b8e65aa61d7a37e8bc61942fbf5042bab489a4f9d4cecb9e2795eae54a82"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-021659-df7c79c/marvel-linux-arm64"
    sha256 "9b93034ff4a73329a7592a73cdb84f690b20a66c34739d24e1b07d6f9c33ee29"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-021659-df7c79c/marvel-linux-amd64"
    sha256 "65c34498d13d9af68b804aeff1aff7ba72fa5227c4c1c737f37986f11fc87dfa"
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
