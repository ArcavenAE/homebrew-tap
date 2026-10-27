class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.182539.e5757ac"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-182539-e5757ac/marvel-darwin-arm64"
    sha256 "853a13df880d5fd5d6c64d17c61b830733754a9e9dc5e8062d0e625a45472614"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-182539-e5757ac/marvel-darwin-amd64"
    sha256 "caae74db9dc0c091b7c0280b118a651d9a11fb8f314110f4ba4c3557687b9985"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-182539-e5757ac/marvel-linux-arm64"
    sha256 "02fd3119f9022def15898324a998236bc3a9b696efee200af1e075d863bc0da3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-182539-e5757ac/marvel-linux-amd64"
    sha256 "1f86cb85e38740cfffb26ffa1ccdfa8540cefabca527978565482461b40d09ee"
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
