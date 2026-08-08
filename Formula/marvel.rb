class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260808.194716.22a5cae"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-194716-22a5cae/marvel-darwin-arm64"
    sha256 "d660e8d4ce6f10e413aaa50d87f901a8f63eadd7635f375db202c24d6ad571b6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-194716-22a5cae/marvel-darwin-amd64"
    sha256 "fa80ca36cc792486a3352f1924d2dcca4098870cc8ab2e8b31282561a95acc77"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-194716-22a5cae/marvel-linux-arm64"
    sha256 "7f0207ca3cb66b6b4c974a1037398615acb64259ed9781c066cc8989b50811b9"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-194716-22a5cae/marvel-linux-amd64"
    sha256 "fca525e8ae42425a02a83a9846872f1cdb097048a38baf2f89f08bb3e69dfd30"
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
