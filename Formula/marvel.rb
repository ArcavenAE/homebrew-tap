class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261104.201217.53a87f0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-201217-53a87f0/marvel-darwin-arm64"
    sha256 "c978741155512c3f295ddd8537e00bd7aa2c06832aa8c05549f5ffbf73bc929d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-201217-53a87f0/marvel-darwin-amd64"
    sha256 "801f5dd313c906f3853f97a9ab8937748f9beafce2d908071adfd869f065f2df"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-201217-53a87f0/marvel-linux-arm64"
    sha256 "28f83e8d78964fb662cffe78772bafeab1af245cc0d431b5a0cc51b152b74037"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-201217-53a87f0/marvel-linux-amd64"
    sha256 "ad562f256597291abdbd6427b06697bc770e163d5dc162ebd8eacd5aac94de67"
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
