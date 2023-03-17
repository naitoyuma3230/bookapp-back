/*
  Warnings:

  - You are about to drop the `_ArticleToUser` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `userBookmarkId` to the `articles` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userBookmarkId` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "_ArticleToUser" DROP CONSTRAINT "_ArticleToUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_ArticleToUser" DROP CONSTRAINT "_ArticleToUser_B_fkey";

-- AlterTable
ALTER TABLE "articles" ADD COLUMN     "userBookmarkId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "users" ADD COLUMN     "userBookmarkId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "_ArticleToUser";

-- CreateTable
CREATE TABLE "UserBookmark" (
    "id" SERIAL NOT NULL,

    CONSTRAINT "UserBookmark_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_userBookmarkId_fkey" FOREIGN KEY ("userBookmarkId") REFERENCES "UserBookmark"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "articles" ADD CONSTRAINT "articles_userBookmarkId_fkey" FOREIGN KEY ("userBookmarkId") REFERENCES "UserBookmark"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
